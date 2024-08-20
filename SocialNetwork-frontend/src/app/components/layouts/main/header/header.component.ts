import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../../../services/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrl: './header.component.css'
})
export class HeaderComponent {
dropdownOpen: any;
toggleDropdown() {
throw new Error('Method not implemented.');
}
  isUserSettingsVisible: any;
  isLoggedIn: boolean = false;

  constructor(private router: Router, private authService: AuthService){
    this.authService.getLoggedInStatus().subscribe(status => {
      this.isLoggedIn = status;
    });
  }

  logout(): void {
    this.authService.logout();
  }
  darkModeON() {
  throw new Error('Method not implemented.');
  }
  toggleUserSettings() {
    this.isUserSettingsVisible = !this.isUserSettingsVisible;
  }
  goToSignUp() {
    this.router.navigate(['/sign-up']);
  }
  goToLogin() {
    this.router.navigate(['/log-in']);
  }
  goToProfile() {
    this.router.navigate(['/edit-profile']);
  }
}
