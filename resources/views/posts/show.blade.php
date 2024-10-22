<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Postni ko'rish</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                @auth
                    @can('update', $post)
                    <div class="row mt-4">
                        <div class="col-lg-2">

                            <a href="{{ route('posts.edit', ['post' => $post->id]) }}" class="btn btn-primary">Edit</a>

                        </div>
                        <div class="col-lg-4">

                            <form action="{{ route('posts.destroy', ['post' => $post->id]) }}" method="POST">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger"> Delete</button>
                            </form>

                        </div>

                    </div>
                    @endcan
                @endauth

                <h4>{{ $post->title }}</h4>
                <h5>{{ $post->short_content }}</h5>
                <p>{{ $post->content }}</p>
                <p> yaratilgan vaqti : {{ $post->created_at->format('d/m/y h:m:s') }}</p>
            </div>
            <div class="col-lg-4" style="border-left: 2px solid black;">
                <h1> {{ $post->comments()->count() }} Comments :</h1>
                @foreach ($post->comments as $comment)
                    <div>{{ $loop->iteration }} ) {{ $comment->body }} :</div>
                    <div style="color: red"> writed by : {{ $comment->user->name }} :</div>
                @endforeach
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <form action="{{ route('comments.store') }}" method="POST">
                    @csrf
                    <p>Write your comment : </p>
                    <input type="hidden" name="post_id" value="{{ $post->id }}">
                    <input type="hidden" name="user_id" value="{{ auth()->user()->id }}">
                    <textarea name="body" id="" cols="20" rows="8" class="form-control">{{ old('body') }}</textarea><br>
                    @error('body')
                        <div style="color: red;">{{ $message }}</div>
                    @enderror
                    <input type="hidden" name="created_at" value="{{ now()->format('d/m/y h:m:s') }}">
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
