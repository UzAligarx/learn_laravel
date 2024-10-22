<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class LanguageController extends Controller
{
    public function set_locale($locale){

        Session::put('locale' , $locale);

        App::setLocale($locale);

        // dd(App::getLocale('locale'));

        return redirect()->back();
    }
}
