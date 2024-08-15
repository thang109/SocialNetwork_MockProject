import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { LoginRequest, SignUpRequest } from '../../models/account';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AccountService } from '../../services/account.service';

@Component({
  selector: 'app-log-in',
  templateUrl: './log-in.component.html',
  styleUrl: './log-in.component.css'
})

export class LogInComponent {
  loginForm : FormGroup;
  constructor(private fb: FormBuilder, private accountService: AccountService) {
    this.loginForm = this.fb.group({
      userName: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  onSubmit() {
    if (this.loginForm.valid) {
      this.accountService.login(this.loginForm.value).subscribe(response => {
        console.log('Login Success:', response);
      }, error => {
        console.error('Login Error:', error);
      });
    }
  }

  // loginRequest: LoginRequest = new LoginRequest();
  // constructor(private http: HttpClient) {}

  // onSubmit() {
  //   this.http.post('https://localhost:7131/api/Account/login', this.loginRequest)
  //     .subscribe(response => {
  //       console.log('Login successful', response);
  //     }, error => {
  //       console.error('Login failed', error);
  //     });
  //   }
}
