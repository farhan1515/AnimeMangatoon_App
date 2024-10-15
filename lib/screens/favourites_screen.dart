import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Favorite Webtoons',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.teal[700], 
      ),
      body: Container(
        
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0093E9),
              Color(0xFF80D0C7)
            ], // Attractive gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<String>('favoritesBox').listenable(),
          builder: (context, Box<String> box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text(
                  'No favorites yet!',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final key = box.keyAt(index);
                final title = box.get(key);

                
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        0.8), 
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    title ?? '',
                    style: const TextStyle(
                      color: Color(0xFF005377), 
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
