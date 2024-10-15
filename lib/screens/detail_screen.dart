import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart'; 

class DetailScreen extends StatefulWidget {
  final String title;
  final String genre;
  final String image;
  final String creator;
  final String description;
  final double initialRating; 
  final ValueChanged<double> onRatingUpdate; 

  const DetailScreen({
    Key? key,
    required this.title,
    required this.genre,
    required this.image,
    required this.creator,
    required this.description,
    required this.initialRating,
    required this.onRatingUpdate, 
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isExpanded = false;
  bool _isFavorited = false;
  late double _currentRating;
  late Box<String> favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<String>('favoritesBox');
    _isFavorited = favoritesBox.values
        .contains(widget.title); 
    _currentRating = widget.initialRating; // Initialize with the passed rating
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        
        final keyToRemove = favoritesBox.keys
            .firstWhere((key) => favoritesBox.get(key) == widget.title);
        favoritesBox.delete(keyToRemove);
      } else {
        // Save to favorites
        favoritesBox.add(widget.title);
      }
      _isFavorited = !_isFavorited;
    });

    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorited
              ? '${widget.title} added to favorites!'
              : '${widget.title} removed from favorites!',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1CB5E0),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(widget.creator),
        backgroundColor: Colors.teal[700],
        actions: [
          IconButton(
            icon: Icon(
              _isFavorited
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: _isFavorited ? Colors.red : Colors.white60,
            ),
            iconSize: 36,
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000046), Color(0xFF1CB5E0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
         
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(widget.image),
                    Positioned(
                      left: 16,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Genre: ${widget.genre}',
                            style: const TextStyle(
                              color: Color(0xFFE0E0E0),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white.withOpacity(0.85),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            _isExpanded
                                ? widget.description
                                : widget.description.length > 100
                                    ? widget.description.substring(0, 100) +
                                        '...'
                                    : widget.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(
                              _isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              size: 24,
                            ),
                            onPressed: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Rating:',
                            style: TextStyle(fontSize: 18),
                          ),
                          RatingBar.builder(
                            initialRating: _currentRating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                _currentRating = rating; 
                              });
                              widget.onRatingUpdate(
                                  rating); 
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
