import 'package:flutter/cupertino.dart';
import 'package:rating_dialog/rating_dialog.dart';

class AppRating extends StatelessWidget {
  const AppRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      initialRating: 1.0,
      title: Text(
        'T20 World Cup',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 40,
          fontFamily: 'e',
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 19, fontFamily: 'a'),
      ),
      // your app's logo?
      image: Image.asset('assets/stars.jpg'),
      submitButtonText: 'Submit',
      commentHint: 'Write your review about our app',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print(
            'rating: ${response.rating}, comment: ${response.comment}');
      },
    );
  }
}