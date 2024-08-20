import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  
  private loggedIn = new BehaviorSubject<boolean>(false);
  private baseUrl = 'https://localhost:7131/accounts';
  
  constructor(private http: HttpClient) {}
  
  IsLoggerIn(): boolean {
    return !!localStorage.getItem('authToken');
  }

  login(username: string, password: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/login`, { username, password }).pipe(
      map((response: any) => {
        if (response.token) {
          localStorage.setItem('token', response.token);
          this.loggedIn.next(true);
        }
        return response;
      })
    );
  }

  logout(): void {
    localStorage.removeItem('token');
    this.loggedIn.next(false);
  }

  isAuthenticated(): boolean {
    return !!localStorage.getItem('token');
  }

  getLoggedInStatus(): Observable<boolean> {
    return this.loggedIn.asObservable();
  }
}
