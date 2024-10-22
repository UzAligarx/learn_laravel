<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login()
    {
        return view('auth.login');
    }

    public function authenticate(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min : 3',
        ]);

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();

            return redirect()->intended('posts');
        }

        return back()->withErrors([
            'email' => 'Kirishda xatolik',
        ])->onlyInput('email');
    }

    public function register()
    {
        return view('auth.registr');
    }

    public function registrStore(Request $request)
    {
        $request->validate([
            'name' => 'required|alpha',
            'email' => 'required|unique:users,email',
            'password' => 'required|min:3',
            'password_confirmation' => 'required|same:password',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        auth()->login($user);

        return redirect()->route('posts.index')->with('succes', 'Tizimga muvafaqqiyatli qo\'shildingiz');
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}
