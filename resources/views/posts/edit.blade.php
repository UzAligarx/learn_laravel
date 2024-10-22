<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <h4>Postni tahrirlash maydoni</h4>
                <form action="{{ route('posts.update' , ['post' => $post->id]) }}" method="POST" enctype="multipart/form-data">

                    @csrf
                    @method('PUT')

                    <select name="category_id" class="form-select form-select-sm">
                        <option disabled>Kategoriyani tanlang ( Majburiy )</option>
                        @foreach ($categories as $category)
                            <option {{ $category->id == $post->category_id ? 'selected' : '' }}  value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>

                    <label>Postning nomi :</label>

                    <select name="tags[]" class="form-select form-select-sm" multiple>
                        <option disabled>Tagni ko'rsating ( Majburiy )</option>
                        @foreach ($tags as $tag)
                            <option value="{{ $tag->id }}">{{ $tag->name }}</option>
                        @endforeach
                    </select>

                    <input type="text" name="title" class="form-control" value="{{ old('title') ? old('title') : $post->title }}"><br>

                    <label>Postning qisqa matni :</label>

                    <input type="text" name="short_content" class="form-control" value="{{ old('short_content') ? old('short_content') : $post->short_content }}"><br>

                    <label>Postning umumiy matni :</label>

                    <textarea type="text" cols="7" rows="6" name="content" class="form-control" >{{ old('content') ? old('content') : $post->content }}</textarea><br>

                    <p>{{ $post->photo ?? 'Bu postga rasm yuklanmagan' }}</p>

                    <label> Rasmni yuklang ( Ixtiyoriy )</label>
                    <input name="photo" type="file" class="form-control"><br>

                    <button type="submit" class=" btn btn-primary "> Update </button>

                </form>
            </div>
        </div>
    </div>

</body>

</html>
