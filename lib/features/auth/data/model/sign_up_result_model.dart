enum SignUpStatus {
  success,
  verificationRequired,
  failed,
}

class SignUpResult {
  final SignUpStatus status;
  final String? error;

  const SignUpResult({
    required this.status,
    this.error,
  });
}