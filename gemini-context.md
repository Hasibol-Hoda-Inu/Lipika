# Flutter Architecture Guidelines for Gemini

## Stack Strategy
- Flutter Version: Strict 3.x stable channel.
- State Management: [Insert Bloc / Riverpod / Provider here]
- Code Gen: Explicit use of Freezed and JsonSerializable for models.

## Safety & Performance Restraints
- Don't block the UI thread. Use `Isolate.run()` for processing text/JSON datasets exceeding 500kb.
- Every async network request utilizing BuildContext must be explicitly guarded by `if (context.mounted)`.
- Always check that controllers (`TextEditingController`, `ScrollController`) are disposed of inside `dispose()`.
-