import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { SignUpRequest } from '../../models/account';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrl: './sign-up.component.css'
})
export class SignUpComponent {
  signUpRequest: SignUpRequest = new SignUpRequest();
  constructor(private http: HttpClient) {}

  onSubmit() {
    this.http.post('https://localhost:7131/api/Account/signup', this.signUpRequest)
      .subscribe(response => {
        console.log('Sign up successful', response);
      }, error => {
        console.error('Sign up failed', error);
      });
  }
}
