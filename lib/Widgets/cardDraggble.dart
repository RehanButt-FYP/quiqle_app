import 'package:flutter/material.dart';


import 'cardContant.dart';

class CardsSectionDraggable extends StatefulWidget {
  @override
  _CardsSectionDraggableState createState() => _CardsSectionDraggableState();
}

class _CardsSectionDraggableState extends State<CardsSectionDraggable> {

  bool dragOverTarget=false;
  List<CardContant> cards =  List();
  int cardsCounter=0;

  @override
  void initState()
  {
    super.initState();
    for(cardsCounter=0;cardsCounter<3;cardsCounter++)
    {
      cards.add(CardContant(cardsCounter));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              dragTarget(),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              dragTarget()
            ],
          ),
          //Back card
          Align
          (
            alignment:  Alignment(0.8, -0.8),
            child:  IgnorePointer(child:  SizedBox.fromSize
            (
              size:  Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.59),
              child: cards[2],
            )),
          ),
          // Middle card
          Align
          (
            alignment:  Alignment(0.6, -0.02),
            child:  IgnorePointer(child:  SizedBox.fromSize
            (
              size:  Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.60),
              child: cards[1],
            )),
          ),
          // Front card
          Align
          (
            alignment:  Alignment(0.0, 1.0),
            child:  Draggable
            (
              feedback:  SizedBox.fromSize
              (
                size:  Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.6),
                child: cards[0],
              ),
              child:  SizedBox.fromSize
              (
                size:  Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.6),
                child: cards[0],
              ),
              childWhenDragging:  Container(),
            ),
          ),
        ],
      ),
    );
  }


  void changeCardsOrder()
  {
    setState((){
      var temp = cards[0];
      cards[0] = cards[1];
      cards[1] = cards[2];
      cards[2] = temp;

      cards[2] =  CardContant(cardsCounter);
      cardsCounter++;
    });
  }
  Widget dragTarget()
  {
    return Flexible(
      flex: 2,
      child: DragTarget(
        builder: (_, __, ___){
          return Container();
        },
        onWillAccept: (_)
          {
            setState(() => dragOverTarget = true);
            return true;
          },
          onAccept: (_)
          {
            changeCardsOrder();
            setState(() => dragOverTarget = false);
          },
          onLeave: (_) => setState(() => dragOverTarget = false)
        ),
      );
  }

}
