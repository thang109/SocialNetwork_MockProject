import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { SignUpComponent } from './components/sign-up/sign-up.component';
import { ConfirmEmailComponent } from './components/confirm-email/confirm-email.component';
import { LogInComponent } from './components/log-in/log-in.component';
import { ForgotPassComponent } from './components/forgot-pass/forgot-pass.component';
import { ResetPassComponent } from './components/reset-pass/reset-pass.component';
import { ChangePassComponent } from './components/change-pass/change-pass.component';
import { EditProfileComponent } from './components/edit-profile/edit-profile.component';
import { HomepageComponent } from './components/pages/homepage/homepage.component';
const routes: Routes = [
  {path: 'sign-up', component: SignUpComponent},
  {path: 'confirm-email', component: ConfirmEmailComponent},
  {path: 'log-in', component: LogInComponent},
  {path: 'forgot-pass', component: ForgotPassComponent},
  {path: 'reset-pass', component: ResetPassComponent},
  {path: 'change-pass', component: ChangePassComponent},
  {path: 'edit-profile', component: EditProfileComponent},
  {path: 'home-page', component: HomepageComponent},
  {path: '**', component: AppComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
