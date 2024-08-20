import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AccountService } from '../../services/account.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrl: './sign-up.component.css'
})

export class SignUpComponent {
  signUpForm : FormGroup;
  
  constructor(private fb: FormBuilder, private accountService: AccountService) {
    this.signUpForm = this.fb.group({
      userName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required],
      confirmPassword: ['', Validators.required]
    });
  }

  onSubmit(): void {
    if (this.signUpForm.valid) {
      console.log(this.signUpForm.value)
      this.accountService.signUp(this.signUpForm.value).subscribe(
        response => {
          console.log('Sign up successful', response);
        },
        error => {
          console.error('Sign up failed', error);
        }
      );
    }
  }
}
