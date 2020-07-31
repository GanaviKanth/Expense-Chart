import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPerOfTotal;

  ChartBar(this.label , this.spendingAmount , this.spendingPerOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
            child: Text('${spendingAmount.toStringAsFixed(0)}'),),
        ),
        SizedBox(
          height: 10,
        ),

        Container(
          height: 50,
          width: 10,
          child: Stack(
            children: <Widget>[

              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,width: 1.0),
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(5),
                    ),
              ),

             FractionallySizedBox(
               heightFactor: spendingPerOfTotal,
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.purple,
                    borderRadius: BorderRadius.circular(5),
                 ),
               ),
             ),

            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(label),
      ],
    );
  }
}