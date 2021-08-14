class Term {
  late final String title;
  late final List values;
  late final List falseValues;

  Term({required this.title, required this.values, required this.falseValues});
}

class TermData {
  static int namberTerm = 0;

  static final List<Term> terms = [
    Term(
      title: 'Термін1',
      values: [
        'значення1',
        'saddas',
        'jyglkixsc',
        'характеризується',
        'фіваіавс',
        'фіваіавс',
        'фіваіавс',
        'фіваіавс',
        'фіваіавс',
        'характеризується',
      ],
      falseValues: [
        'неправильно1',
        'неправильно2',
        'неправильно3',
        'неправильно4',
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
        'неправильно1',
        'неправильно2',
        'неправильно3',
        'неправильно4',
        'неправильно5',
        'неправильно6',
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
        'неправильно1',
        'неправильно2',
        'неправильно3',
        'неправильно4',
        'неправильно5',
        'неправильно6',
        'неправильно7',
      ],
    ),
    Term(
      title: 'Термін4',
      values: [
        'значення4',
        'saddas',
        'jyglkixsc',
        'характеризується',
        'фіваіавс',
        'jyglkixsc',
        'характеризується',
        'фіваіавс',
        'фіваіавс',
        'фіваіавс',
      ],
      falseValues: [
        'неправильно1',
        'неправильно2',
        'неправильно3',
        'неправильно4',
        'неправильно5',
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
        'неправильно1',
        'неправильно2',
      ],
    ),
  ];
}
