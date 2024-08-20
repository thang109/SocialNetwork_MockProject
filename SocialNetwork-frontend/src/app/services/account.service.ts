import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { SignUpRequest, ConfirmEmailRequest, LoginRequest, ForgotPasswordRequest, ResetPasswordRequest, ChangePasswordRequest, EditProfileRequest } from '../models/account';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  private baseUrl = 'https://localhost:7131/accounts';

  constructor(private http: HttpClient) { }

  signUp(signUpRequest: SignUpRequest): Observable<any> {
    return this.http.post(`${this.baseUrl}/signUp`, signUpRequest);
  }
  confirmEmail(confirmEmailRequest: ConfirmEmailRequest): Observable<any> {
    return this.http.post(`${this.baseUrl}/confirmEmail`, confirmEmailRequest);
  }
  login(loginRequest: LoginRequest): Observable<any> {
    return this.http.post(`${this.baseUrl}/login`, loginRequest);
  }
  forgotPassword(forgotPasswordRequest: ForgotPasswordRequest): Observable<any> {
    return this.http.post(`${this.baseUrl}/forgotPassword`, forgotPasswordRequest);
  }
  resetPassword(resetPasswordRequest: ResetPasswordRequest): Observable<any> {
    return this.http.post(`${this.baseUrl}/resetPassword`, resetPasswordRequest);
  }
  changePassword(changePasswordRequest: ChangePasswordRequest): Observable<any> {
    return this.http.patch(`${this.baseUrl}/changePassword`, changePasswordRequest);
  }
  editProfile(editProfileRequest: EditProfileRequest): Observable<any> {
    return this.http.patch(`${this.baseUrl}/editProfile`, editProfileRequest);
  }
  logout(): Observable<any>{
    return this.http.post(`${this.baseUrl}/logout`, {});
  }
}
