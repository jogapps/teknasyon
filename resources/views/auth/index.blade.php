@extends('layouts.app')

@section('content')
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 p-t-50 p-b-90">
            <form class="login100-form validate-form flex-sb flex-w"  method="POST" action="{{ route('signin') }}">
                @csrf
                <center>
                    <span class="login100-form-title p-b-15">Orient Special School <br>Ogbunike</span>
                    <h6 class="p-b-51">School Portal</h6>
                </center>

                
                <div class="wrap-input100 validate-input m-b-5" data-validate = "userId is required">
                    <input id="userId" type="text" class="input100 @error('userId') is-invalid @enderror" placeholder="User Id" name="user_id" value="{{ old('userId') }}" required autocomplete="userId" autofocus>
                    <span class="focus-input100"></span>
                </div>
                @error('userId')
                    <small class="m-b-10 text-danger">
                        <strong>{{ $message }}</strong>
                    </small>
                @enderror
                
                
                <div class="wrap-input100 validate-input m-b-5" data-validate = "Password is required">
                    <input id="password" type="password" class="input100 @error('password') is-invalid @enderror" placeholder="Password" name="password" required autocomplete="current-password">
                    <span class="focus-input100"></span>
                </div>
                @error('password')
                    <small class="m-b-10 text-danger">
                        <strong>{{ $message }}</strong>
                    </small>
                @enderror
                
                <!-- <div class="flex-sb-m w-full p-t-3 p-b-24">
                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                        <label class="label-checkbox100" for="ckb1">
                            Remember me
                        </label>
                    </div>

                    
                </div> -->

                <div class="container-login100-form-btn m-t-17">
                    <button type="submit" class="login100-form-btn">
                        Login
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>
	

	<div id="dropDownSelect1"></div>
@endsection
