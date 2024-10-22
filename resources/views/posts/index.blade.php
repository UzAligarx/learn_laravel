<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery (Bootstrap 4 uchun zarur) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <title>Postlar ro'yxati</title>
</head>

<body>
    <div class="row">
        <div class="col-lg-4">
            @auth

                <a href="{{ route('posts.create') }}" class="btn btn-success p-2 m-4">Create New Post</a>
                <a href="{{ route('logout') }}" class="btn btn-outline-danger">Chiqish</a>

                &nbsp;&nbsp;

                {{-- {{ __('Bosh sahifa') }}
                    @foreach ($all_locales as $locale)
                        <a href="{{ route('locale' , ['locale' =>  $locale ]) }}" class="btn btn-outline-success"> {{ $locale }}</a>
                    @endforeach --}}

            @else
                <a class="btn btn-success p-2 m-4" href="{{ route('login') }}"> Kirish </a>

            @endauth


            {{-- @foreach ($all_locales as $local)

                <a class="btn btn-success p-2 m-4" href="#""> {{ $local }} </a>

            @endforeach --}}

        </div>
        <div class="col-lg-1 pt-3">

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor"
                    class="bi bi-bell" viewBox="0 0 16 16">
                    <path
                        d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6" />
                </svg>
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        @isset($notifications)



                            @foreach ($notifications as $notification)
                                <div class="modal-body "
                                    style="border: 1px solid rgb(48, 90, 153); margin: 6px; border-radius: 10px">

                                    <p>{{ $notification->created_at }} </p>
                                    <h4>Postning ID raqami : {{ $notification->data['id'] }}</h4>
                                    <p>Postning sarlavhasi : {{ $notification->data['title'] }}</p>
                                    <p>Post Statusi :
                                        {{ $notification->type === 'App\Notifications\PostCreated' ? 'Post yaratildi' : 'Post Tahrirlandi' }}
                                    </p>

                                    @if (!$notification->read_at)
                                        <form
                                            action="{{ route('notifications.update', ['notification' => $notification->id]) }}"
                                            method="POST">
                                            @csrf
                                            <input type="hidden" name="id" value="{{ $notification->id }}">
                                            @method('PUT')
                                            <button type="submit" class="btn btn-success">O'qildi</button>
                                        </form>
                                    @endif


                                </div>
                            @endforeach

                        @endisset

                    </div>
                </div>
            </div>

            @if (auth()->user()->unReadNotifications()->count())
                <span
                    class="absolute top-0 right-0 inline-flex items-center justify-center px-1.5 py-0.5 text-xs font-bold leading-none bg-red-600 rounded-full">
                    {{ auth()->user()->unReadNotifications()->count() }}
                </span>
            @endif
        </div>


    </div>
    <div class="container">

        @foreach ($posts as $post)
            @if ($loop->index % 3 == 0)
                <div class="row">
            @endif
            <div class="col-lg-4 p-4">
                @if ($post->tags->isNotEmpty())
                    @foreach ($post->tags as $tag)
                        <a style="color: red">{{ $tag->name }} |</a>
                    @endforeach
                @endif
                <h3>{{ $post->title }}</h3>

                <h4>{{ $post->short_content }}</h4>

                <img src="{{ asset($post->photo) }}" class="img-thumbnail">

                <p>{{ $post->created_at->format('d M Y H:m') }}</p>

                <a href="{{ route('posts.show', ['post' => $post->id]) }}" class="btn btn-success">Show details</a>

            </div>

            @if ($loop->index % 3 == 2)
    </div>
    @endif
    @endforeach
    </div>
    </div>
    <div class="row ml-3">4
        <div class="col-l-12">
            <h3>Categories : </h3>
            @foreach ($categories as $category)
                <a class="btn btn-outline-primary mt-1"
                    href="{{ route('sortedCategory', ['id' => $category->id]) }}">>{{ $category->name }} <span
                        class="badge badge-dark"
                        style="color: black; font-size: 16px">{{ $category->posts()->count() }}</span></a><br>
            @endforeach

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
