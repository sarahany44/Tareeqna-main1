class ApiUrls {
  static const baseUrl = 'https://on-road-backend.vercel.app/';

  // Auth Endpoints
  static const register = '${baseUrl}auth/register';
  static const verifyEmail = '${baseUrl}auth/verify-email';
  static const resendVerifyEmail = '${baseUrl}auth/resend-verify-email';

  static const setPassword = '${baseUrl}auth/set-password';
  static const resetPassword = '${baseUrl}auth/reset-password';
}