// ignore_for_file: unnecessary_string_interpolations

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:crypto/ui/component.dart';

class DetailWalletScreen extends StatelessWidget {
  const DetailWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.black54)),
              title: 'Bitcoin Wallet',
              right: const Icon(Icons.more_vert, color: Colors.black54)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 25,
            ),
            _cardWallet(
              iconUrl:
                  'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/128/Bitcoin-icon.png',
              crypto: 'Bitcoin',
              cryptoShort: 'BTC',
              totalCrypto: '5.519020 BTC',
              total: '\$19.16673 USD',
              precent: -2.33,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Day'),
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: const BorderRadius.all(Radius.circular(30))),
                      child: const Text(
                        'Week',
                        style: TextStyle(color: Colors.white),
                      )),
                  const Text('Month'),
                  const Text('Year'),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            card(
              padding: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _dot(color: Colors.black),
                            const Text(
                              'Lower: \$4.896',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _dot(color: Colors.green),
                            const Text(
                              'Higher:\$6.857',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Stack(children: [
                      LineChart(
                        sampleData(),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Row(
                          children: [
                            _dot(size: 18, color: Colors.orangeAccent),
                            const Text(
                              '1BTC=\$5.483',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: _actionButton(
                    text: 'Buy',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: _actionButton(
                    text: 'Sell',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: const LineTouchData(
        enabled: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      // minX: 0,
      maxX: 12,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          const FlSpot(1, 2),
          const FlSpot(3, 2.8),
          const FlSpot(7, 2.2),
          const FlSpot(10, 2.8),
          const FlSpot(12, 2.6),
          const FlSpot(13, 3),
        ],
        isCurved: true,
        color: Colors.orangeAccent,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.blue[100],
        ),
      ),
    ];
  }

  Widget _dot({double size = 10, Color color = Colors.black}) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Widget _cardWallet(
      {required String crypto,
      cryptoShort,
      iconUrl,
      total,
      totalCrypto,
      required double precent}) {
    return card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                '$iconUrl',
                width: 50,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text('$crypto',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text('$cryptoShort')
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '$totalCrypto',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black87),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$total',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black38),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                    color: precent >= 0 ? Colors.green : Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Text(
                  precent >= 0 ? '+ $precent %' : '$precent %',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const Center(
            child: Icon(Icons.keyboard_arrow_down,
                size: 30, color: Colors.black45),
          )
        ],
      ),
    );
  }

  Widget _actionButton({required Color color, required String text}) {
    return card(
        child: Column(
      children: [
        ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              splashColor: Colors.red, // inkwell color
              child: const SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 25.0,
                  )),
              onTap: () {},
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text('$text', style: const TextStyle(fontSize: 24, color: Colors.black54))
      ],
    ));
  }
}
