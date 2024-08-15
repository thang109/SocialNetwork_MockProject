import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ResetPasswordRequest } from '../../models/account';
import { response } from 'express';
import { error } from 'console';

@Component({
  selector: 'app-reset-pass',
  templateUrl: './reset-pass.component.html',
  styleUrl: './reset-pass.component.css'
})
export class ResetPassComponent {
  resetPasswordRequest: ResetPasswordRequest = new ResetPasswordRequest();
  constructor(private http: HttpClient){}

  onSubmit(){
    this.http.post('https://localhost:7131/api/Account/resetPassword', this.resetPasswordRequest)
    .subscribe(response =>{
      console.log('Reset Password Successfull', response);
    }, error =>{
      console.error('Reset Password Failed', error);
    })
  }
}
