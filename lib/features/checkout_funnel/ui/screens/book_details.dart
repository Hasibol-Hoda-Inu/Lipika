import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                IconButton.filledTonal(
                    onPressed: (){},
                    icon: const Icon(Icons.favorite_outline)
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Add to Cart"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
