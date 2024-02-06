import 'dart:math';

import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int dicOne = -1;
 int dicTwo = -1;
 bool isReady = false;
  Widget buildDiceCard(String title , int index){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,
          style: const TextStyle(fontSize: 22,
              decoration: TextDecoration.underline),),
          const SizedBox(height: 48,),
          isReady ? Image.asset('assets/dics/$index.png'):
          Container(
            height: 150,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text('Dice 1'),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Dice Roller",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold
            ,color: Theme.of(context).primaryColor),),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: buildDiceCard("Player 1",dicOne)),
                Expanded(child: buildDiceCard("Player 2",dicTwo)),
              ],
            ),
            if (isReady)
              Text(dicOne != dicTwo ?
                  dicOne > dicTwo ? 'Plyaer 1 is winner' : "Player 2 is winnner"
               : 'Draw'),
            //const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Random random = Random();
              int randOne = random.nextInt(6) +1 ;
              int randTwo = random.nextInt(6) + 1;
              setState(() {
                dicOne = randOne;
                dicTwo = randTwo;
                isReady = true;
              });
            },
                child: const Text("Roll Dices",
                  style: TextStyle(fontSize: 24),)
            )
          ],
        ),
      ),
    );
  }
}
