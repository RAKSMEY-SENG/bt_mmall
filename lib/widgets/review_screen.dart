import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  double _rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: new Text("4.6",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                    ),
                    RatingBar(
                      onRatingChanged: (rating) => setState(() => _rating = rating),
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      halfFilledIcon: Icons.star_half,
                      isHalfAllowed: true,
                      filledColor: Colors.redAccent,
                      halfFilledColor: Colors.amberAccent,
                      size: 20,
                      initialRating: 1,
                    ),
                  ],
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20,right: 15),
                    child: Column(
                      children: <Widget>[
                        new Text("5 Stars"),
                        SizedBox(height: 10,),
                        new Text("4 Stars"),
                        SizedBox(height: 10,),
                        new Text("3 Stars"),
                        SizedBox(height: 10,),
                        new Text("2 Stars"),
                        SizedBox(height: 10,),
                        new Text("1 Stars"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,right: 5),
                    child: Column(
                      children: <Widget>[
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 95,
                          size: 5,
                          padding: 0,
                          selectedColor: Colors.redAccent,
                          unselectedColor: Colors.grey[350],
                        ),
                        SizedBox(height: 20,),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 80,
                          size: 5,
                          padding: 0,
                          selectedColor: Colors.redAccent,
                          unselectedColor: Colors.grey[350],
                        ),
                        SizedBox(height: 20,),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 50,
                          size: 5,
                          padding: 0,
                          selectedColor: Colors.redAccent,
                          unselectedColor: Colors.grey[350],
                        ),
                        SizedBox(height: 20,),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 20,
                          size: 5,
                          padding: 0,
                          selectedColor: Colors.redAccent,
                          unselectedColor: Colors.grey[350],
                        ),
                        SizedBox(height: 20,),
                        StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 5,
                          size: 5,
                          padding: 0,
                          selectedColor: Colors.redAccent,
                          unselectedColor: Colors.grey[350],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
