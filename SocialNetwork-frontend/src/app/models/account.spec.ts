import { SignUpRequest, ConfirmEmailRequest, LoginRequest, ForgotPasswordRequest, ResetPasswordRequest, EditProfileRequest, ChangePasswordRequest } from './account';

describe('Account Classes', () => {
  it('should create an instance of SignUpRequest', () => {
    expect(new SignUpRequest()).toBeTruthy();
  });

  it('should create an instance of ConfirmEmailRequest', () => {
    expect(new ConfirmEmailRequest()).toBeTruthy();
  });

  it('should create an instance of LoginRequest', () => {
    expect(new LoginRequest()).toBeTruthy();
  });

  it('should create an instance of ForgotPasswordRequest', () => {
    expect(new ForgotPasswordRequest()).toBeTruthy();
  });

  it('should create an instance of ResetPasswordRequest', () => {
    expect(new ResetPasswordRequest()).toBeTruthy();
  });

  it('should create an instance of EditProfileRequest', () => {
    expect(new EditProfileRequest()).toBeTruthy();
  });

  it('should create an instance of ChangePasswordRequest', () => {
    expect(new ChangePasswordRequest()).toBeTruthy();
  });
});
