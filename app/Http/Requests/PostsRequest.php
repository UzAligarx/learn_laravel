<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostsRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|max:64|string',
            'short_content' => 'required|min:32|max:256|string',
            'content' => 'required|string',
            'photo' => 'nullable|mimes:png,jpg,img|max:2048',
        ];
    }

    public function message()
    {
        return [
            'title.required' => 'Saralavhasi bo\'sh bo\'lishi mumkin emas',
            'title.max' => 'Sarlavha nomi 64 ta belgidan ko\'p bo\'lmasin',
            'title.string' => 'Sarlavha matn turida bo\'lishi shart',
            'short_content.required' => 'Qisqacha tasnifi bo\'sh bo\'lishi mumkin emas',
            'short_content.min' => 'Qisqacha tasnifi 64 ta belgidan ko\'p bo\'lishi kerak.',
            'short_content.max' => 'Qisqacha tasnifi 256 ta belgidan kam bo\'lishi kerak.',
            'short_content.string' => 'Qisqacha tasnifi matn turida bo\'lishi kerak',
            'content.required' => 'Postning tasnifi bo\'sh bo\'lishi mumkin emas',
            'content.string' => 'Postning tasnifi matn turida bo\'lishi kerak',
            'photo.image' => 'Rasm maydoniga faqat rasm yuklang',
            'photo.max' => 'Rasm maydoniga faqat 2MB dan kam rasm yuklang',
        ];
    }

}
