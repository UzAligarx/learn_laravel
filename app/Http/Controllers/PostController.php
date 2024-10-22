<?php

namespace App\Http\Controllers;

use App\Events\PostCreated;
use App\Http\Requests\PostsRequest;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use App\Notifications\PostCreated as NotificationsPostCreated;
use App\Notifications\PostUpdated;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    public function __construct() {}

    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $posts = Cache::remember('AllPosts', 120, function () {
            return  $posts = Post::all();
        });



        $categories = Category::all();

        return view('posts.index', [
            'posts' => $posts,
            'categories' => $categories,
            'notifications' => auth()->user()->notifications()->get(),
        ]);

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $category = Category::all();
        $tags = Tag::all();

        return view('posts.create', [
            'categories' => $category,
            'tags' => $tags,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PostsRequest $request)
    {
        $path = null;
        if ($request->hasFile('photo')) {
            $name = Carbon::now()->format('d_m_Y_H_m_s_').$request->file('photo')->getClientOriginalName();
            $path = $request->file('photo')->storeAs('post-photos', $name, 'public');
        }
        $post = Post::create([
            'title' => $request->title,
            'user_id' => $request->user_id,
            'category_id' => $request->category_id,
            'short_content' => $request->short_content,
            'content' => $request->content,
            'photo' => $path,
        ]);

        if (isset($request->tags)) {
            foreach ($request->tags as $tag) {
                $post->tags()->attach($tag);
            }
        }

        PostCreated::dispatch($post);

        Notification::send(auth()->user(), new NotificationsPostCreated($post));

        return redirect()->route('posts.index');

    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $categories = Category::all();
        $post = Post::findOrFail($id);

        return view('posts.show', [
            'post' => $post,
            'categories' => $categories,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {

        Gate::authorize('update', $post);

        // The action is authorized...

        $tags = Tag::all();
        $post = Post::findOrFail($post->id);
        $category = Category::all();

        return view('posts.edit', [
            'post' => $post,
            'categories' => $category,
            'tags' => $tags,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(PostsRequest $request, Post $post)
    {

        Gate::authorize('update', $post);

        // The action is authorized...

        $path = $post->photo;

        if ($request->hasFile('photo')) {

            $name = now()->format('m_d_y_H_s_i').$request->file('photo')->getClientOriginalName();

            $path = $request->file('photo')->storeAs('post-photos', $name, 'public');

            if (isset($data->photo)) {
                Storage::delete($post->photo);
            }
        }
        $post->update([
            'title' => $request->title,
            'category_id' => $request->category_id,
            'short_content' => $request->short_content,
            'content' => $request->content,
            'photo' => $path,
        ]);

        if (isset($request->tags)) {

            foreach ($request->tags as $tag) {
                $post->tags()->attach($tag);
            }
        }

        Notification::send(auth()->user(), new PostUpdated($post));

        return redirect()->route('posts.index')->with('success', 'Muvaffaqqiyatli yangilandi');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        Gate::authorize('delete', $post);

        // The action is authorized...

        Post::destroy($post->id);

        return redirect()->route('posts.index');
    }

    public function sortedByCategory($id)
    {
        $category = Category::findOrFail($id);
        $categories = Category::all();
        $posts = $category->posts;

        return view('posts.index', [
            'posts' => $posts,
            'categories' => $categories,
        ]);
    }
}
