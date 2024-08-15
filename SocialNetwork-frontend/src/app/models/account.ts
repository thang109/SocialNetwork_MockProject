export class SignUpRequest {
    userName: string = '';
    email: string = '';
    password: string = '';
    confirmPassword: string = '';
  }

  export class ConfirmEmailRequest{
    email: string = '';
    code: string = '';
  }
  
  export class LoginRequest {
    userName: string = '';
    password: string = '';
  }

  export class ForgotPasswordRequest {
    email: string = '';
  }

  export class ResetPasswordRequest{
    token: string = '';
    newPassword: string = '';
  }
  
  export class EditProfileRequest {
    email: string = '';
    userName?: string = '';
    bio?: string;
    profilePictureUrl?: string;
  }
  
  export class ChangePasswordRequest {
    userName: string = '';
    oldPassword: string = '';
    newPassword: string = '';
  }