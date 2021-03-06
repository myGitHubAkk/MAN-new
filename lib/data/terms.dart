class Term {
  late final String title;
  late final List values;
  late final List falseValues;

  Term({required this.title, required this.values, required this.falseValues});
}

class TermData {
  static final List<Term> terms = [
    Term(
      title: 'Термін1',
      values: [
        '1',
        '2',
        '3',
      ],
      falseValues: [
        [
          'неп1.1',
          'неп1.2',
          'неп1.3',
        ],
        [
          'неп2.1',
          'неп2.2',
          'неп2.3',
        ],
        [
          'неп3.1',
          'неп3.2',
          'неп3.3',
        ],
      ],
    ),
    Term(
      title: 'Термін2',
      values: [
        'значення2',
        'saddasasddzxczx',
        'jyglkixsc',
        'характеризується',
        'фіваіавс',
      ],
      falseValues: [
        [
          'неп1.1',
          'неп1.2',
          'неп1.3',
        ],
        [
          'неп2.1',
          'неп2.2',
          'неп2.3',
        ],
        [
          'неп3.1',
          'неп3.2',
          'неп3.3',
        ],
        [
          'неп4.1',
          'неп4.2',
          'неп4.3',
        ],
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
      ],
    ),
    Term(
      title: 'Термін3',
      values: [
        'значення3',
        'saddas',
        'фіваіавс',
        'jyglkixsc',
        'характеризується',
        'фіваіавс',
      ],
      falseValues: [
        [
          'неп1.1',
          'неп1.2',
          'неп1.3',
        ],
        [
          'неп2.1',
          'неп2.2',
          'неп2.3',
        ],
        [
          'неп3.1',
          'неп3.2',
          'неп3.3',
        ],
        [
          'неп4.1',
          'неп4.2',
          'неп4.3',
        ],
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
      ],
    ),
    Term(
      title: 'Термін4',
      values: [
        'значення4',
        'saddas',
        'jyglkixsc',
        'характеризується',
      ],
      falseValues: [
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
        [
          'неп5.1',
          'неп5.2',
          'неп5.3',
        ],
      ],
    ),
    Term(
      title: 'Термін5',
      values: [
        'значення5',
        'характеризується',
        'fsdfsd',
        'fsdfsd',
      ],
      falseValues: [
        [
          'неп1.1',
          'неп1.2',
          'неп1.3',
        ],
        [
          'неп2.1',
          'неп2.2',
          'неп2.3',
        ],
        [
          'неп3.1',
          'неп3.2',
          'неп3.3',
        ],
        [
          'неп4.1',
          'неп4.2',
          'неп4.3',
        ],
      ],
    ),
  ];
}
