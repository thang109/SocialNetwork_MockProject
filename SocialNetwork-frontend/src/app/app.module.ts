import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SignUpComponent } from './components/sign-up/sign-up.component';
import { ConfirmEmailComponent } from './components/confirm-email/confirm-email.component';
import { LogInComponent } from './components/log-in/log-in.component';
import { ForgotPassComponent } from './components/forgot-pass/forgot-pass.component';
import { ResetPassComponent } from './components/reset-pass/reset-pass.component';
import { ChangePassComponent } from './components/change-pass/change-pass.component';
import { EditProfileComponent } from './components/edit-profile/edit-profile.component';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { provideHttpClient, withFetch } from '@angular/common/http';
import { HeaderComponent } from './components/layouts/main/header/header.component';
import { FooterComponent } from './components/layouts/main/footer/footer.component';
import { LeftSideBarComponent } from './components/layouts/main/left-side-bar/left-side-bar.component';
import { RightSideBarComponent } from './components/layouts/main/right-side-bar/right-side-bar.component';
import { MainBarComponent } from './components/layouts/main/main-bar/main-bar.component';
import { HomepageComponent } from './components/pages/homepage/homepage.component';
import { ProfileComponent } from './components/pages/profile/profile.component';

@NgModule({
  declarations: [
    AppComponent,
    SignUpComponent,
    ConfirmEmailComponent,
    LogInComponent,
    ForgotPassComponent,
    ResetPassComponent,
    ChangePassComponent,
    EditProfileComponent,
    HeaderComponent,
    FooterComponent,
    LeftSideBarComponent,
    RightSideBarComponent,
    MainBarComponent,
    HomepageComponent,
    ProfileComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    RouterModule.forRoot([]),
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    provideClientHydration(),
    provideHttpClient(withFetch())
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
