import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

// those use in home screen for see differance between pricing of gold and metal

TextStyle styleOfFirstRow = TextStyle(
  fontSize: 12.spMin,
  fontWeight: FontWeight.w600,
);

TextStyle styleOfUnderFirstRow = TextStyle(
  fontSize: 12.spMin,
  fontWeight: FontWeight.w400,
);

Widget tableTimeOPriceWidget() {
  return Table(
    // i use dot all because make black border between colum
    border: TableBorder.all(
      borderRadius: BorderRadius.circular(5),
      color: Colors.grey,
    ),
    children: [
      TableRow(
        decoration: const BoxDecoration(
          color: Color(0xFFF0F0F0),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  'change',
                  style: styleOfFirstRow,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text('price', style: styleOfFirstRow),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  'Amount',
                  style: styleOfFirstRow,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '%',
                  style: styleOfFirstRow,
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  'today',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(child: Text('1900')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text('+99', style: styleOfUnderFirstRow),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '+24.5',
                  style: TextStyle(
                    color: pTextMoveUnderColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  'last week',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '1650',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '+2.6',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '-2.6',
                  style: TextStyle(
                    color: pTextMoveUnderColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '1 month',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '1650',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '+2.6',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '-2.6',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '1 year',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text('1650'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '+2.6',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '-2.6',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '2 year',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text('1650'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '+2.6',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '-2.6',
                  style: TextStyle(
                    color: pTextMoveUnderColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  'all',
                  style: styleOfUnderFirstRow,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text('1650'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '+2.6',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  '-2.6',
                  style: TextStyle(
                    color: pTextMoveUnderColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget tableMetalPriceWidget() => Table(
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Color(0xFFF0F0F0),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    'Gold purity',
                    style: styleOfFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    'price',
                    style: styleOfFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    'date',
                    style: styleOfFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    'Change',
                    style: styleOfFirstRow,
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '24k',
                    style: styleOfUnderFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '1900',
                    style: styleOfUnderFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '20 Aug 2022',
                    style: styleOfUnderFirstRow,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                    child: Text(
                  '+24.5',
                  style: TextStyle(
                    color: pTextMoveUpColor,
                    fontSize: 13,
                  ),
                )),
              ),
            ),
          ],
        ),
        const TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text('21k'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text('1650'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text('10 oct 2022'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '-2.6',
                    style: TextStyle(
                      color: pTextMoveUnderColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '18k',
                    style: styleOfUnderFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '1650',
                    style: styleOfUnderFirstRow,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '6 Nov 2021',
                    style: styleOfUnderFirstRow,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '-2.6',
                    style: TextStyle(
                      color: pTextMoveUpColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
