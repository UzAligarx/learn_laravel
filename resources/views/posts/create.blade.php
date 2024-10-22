<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post yaratish maydoni</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>

    <div class="container">
        <div class="row m-5">
            <div class="col-lg-4 justify-content-center">
                <form action="{{ route('posts.store') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <select name="category_id" class="form-select form-select-sm">
                        <option selected>Kategoriyani tanlang ( Majburiy )</option>
                        @foreach ($categories as $categoriy)
                            <option value="{{ $categoriy->id }}">{{ $categoriy->name }}</option>
                        @endforeach
                    </select>
                    <br>
                    <label for="basic-url">Postning nomi :</label>
                    <div class="input-group mb-3">
                        <input name="title" value="{{ old('title') }}" type="text" class="form-control"
                            id="basic-url" aria-describedby="basic-addon3">
                    </div>

                    @if ($errors->has('title'))
                        <span class="text-danger">{{ $errors->first('title') }}</span>
                    @endif

                    <select name="tags[]" class="form-select form-select-sm" multiple>
                        <option selected>Tagni ko'rsating ( Majburiy )</option>
                        @foreach ($tags as $tag)
                            <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                        @endforeach
                    </select>
                    <br>

                    <label for="basic-url">Postning qisqa matni :</label>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="short_content"
                            value="{{ old('short_content') }}" id="basic-url" aria-describedby="basic-addon3">
                    </div>

                    @if ($errors->has('short_content'))
                        <span class="text-danger">{{ $errors->first('short_content') }}</span>
                    @endif

                    <label for="basic-url">Postning to'liq matni :</label>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="content" value="{{ old('content') }}"
                            id="basic-url" aria-describedby="basic-addon3">
                    </div>

                    @if ($errors->has('content'))
                        <span class="text-danger">{{ $errors->first('content') }}</span>
                    @endif

                    <div class="mb-2">
                        <label for="formFile" class="form-label">Postga rasm yuklang ( ixtiyoriy )</label>
                        <input class="form-control" type="file" name="photo" id="formFile">
                    </div>

                    @if ($errors->has('photo'))
                        <span class="text-danger">{{ $errors->first('photo') }}</span>
                    @endif

                    <input type="hidden" name="created_at" value="{{ now()->format('d/m/y H:m:s') }}">
                    <input type="hidden" name="user_id" value="{{ auth()->user()->id }}">
                    <button class="btn btn-primary" type="submit" name="send">Save Post</button>

                </form>
            </div>
        </div>
    </div>

</body>

</html>
