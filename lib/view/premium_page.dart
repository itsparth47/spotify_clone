import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 13),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              height: 50,
              child: const Center(
                child: Text(
                  'GET PREMIUM',
                  style: TextStyle(
                      fontFamily: 'SpotifyCircular',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text('From 119/month after. Offer only for users who are new to', style: TextStyle(
                fontFamily: 'SpotifyCircular',
                fontSize: 12,
                color: Color(0xFF535353)
            ),
            ),
            Row(
              children: const [
                Text('Premium. ', style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    fontSize: 12,
                    color: Color(0xFF535353)
                ),
                ),
                Text('Terms and Conditions apply', style: TextStyle(
                    fontFamily: 'SpotifyCircular',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF535353)
                ),
                height: 270,
                child: Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Why join Premium?', style: TextStyle(
                          fontFamily: 'SpotifyCircular',
                          fontSize: 18,
                          color: Colors.white
                      ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check, color: Colors.green, size: 27,),
                          SizedBox(width: 10,),
                          Text('Download to listen offline without wifi', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Colors.white
                          ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check, color: Colors.green, size: 27,),
                          SizedBox(width: 10,),
                          Text('Music without ad interruptions', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Colors.white
                          ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check, color: Colors.green, size: 27,),
                          SizedBox(width: 10,),
                          Text('2x higher sound quality than out free plan', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Colors.white
                          ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check, color: Colors.green, size: 27,),
                          SizedBox(width: 10,),
                          Text('Cancel monthly plans online anytime', style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontSize: 13,
                              color: Colors.white
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
            const SizedBox(height: 50,),
            Container(
              height: 67,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF535353)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Spotify Free', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    ),
                    Text('CURRENT PLAN', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 57,),
            const Text('Pick your Premium', style: TextStyle(
                fontFamily: 'SpotifyCircular',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
            ),
            const SizedBox(height: 35,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.blueAccent
                      ])
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Mini', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 17,
                            color: Colors.white
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('From ₹7', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 25,
                                color: Colors.white
                            ),
                            ),
                            Text('FOR 1 DAY', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                      child : Text('1 day and 1 week plans • Ad-free music on mobile'
                          ' • Download 30 songs on one mobile device'
                          ' • Mobile only plan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'VIEW PLANS',
                          style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Prices vary according to duration of plan.', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Terms and Conditons', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('apply.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 33,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        Colors.green.shade700,
                        Colors.green.shade300
                      ])
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Premium Individual', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 17,
                            color: Colors.white
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Free', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 25,
                                color: Colors.white
                            ),
                            ),
                            Text('FOR 1 MONTH', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                      child : Text('Ad-free music listening'
                          ' • Download to listen offline'
                          ' • Debit and credit cards accepted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'VIEW PLANS',
                          style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Offer only for users who are new to Premium.', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Terms and Conditons', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('apply.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 33,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        Colors.lightBlueAccent.shade100,
                        Colors.lightBlueAccent.shade700
                      ])                  ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Premium Duo', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 17,
                            color: Colors.white
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Free', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 25,
                                color: Colors.white
                            ),
                            ),
                            Text('FOR 1 Month', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                      child : Text('2 Premium accounts • For couples who live together'
                          ' • Ad-free music listening'
                          ' • Download 10,000 songs/device, on upto 5 devices per account'
                          ' • Choose 1, 3, 6 or 12 months of Premium'
                          ' • Debit and credit cards accepted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'VIEW PLANS',
                          style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Offer only for users who are new to Premium.', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Terms and Conditons', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('apply.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 33,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple
                      ])                  ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Premium Family', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 17,
                            color: Colors.white
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Free', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 25,
                                color: Colors.white
                            ),
                            ),
                            Text('FOR 1 Month', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                      child : Text(
                        ' • Ad-free music listening'
                            ' • Choose 1, 3, 6 or 12 months of Premium'
                            ' • Debit and credit cards accepted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'VIEW PLANS',
                          style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Offer only for users who are new to Premium.', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Terms and Conditons', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('apply.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 33,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.orangeAccent.shade100
                      ])                  ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 35, 30, 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Premium Student', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 17,
                            color: Colors.white
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text('Free', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 25,
                                color: Colors.white
                            ),
                            ),
                            Text('FOR 1 Month', style: TextStyle(
                                fontFamily: 'SpotifyCircular',
                                fontSize: 10,
                                color: Colors.white
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, top: 50),
                      child : Text(
                        ' • Ad-free music listening'
                            ' • Download to listen offline',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'VIEW PLANS',
                          style: TextStyle(
                              fontFamily: 'SpotifyCircular',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Offer only for users who are new to Premium.', style: TextStyle(
                        fontFamily: 'SpotifyCircular',
                        fontSize: 10,
                        color: Colors.white
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Terms and Conditons', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('apply.', style: TextStyle(
                            fontFamily: 'SpotifyCircular',
                            fontSize: 10,
                            color: Colors.white
                        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 145,),
          ],
        ),
      ),
    );
  }
}
