class Question{
     // late String questionText; => use required before initialization of variable in constructor
     // late bool questionAnswer;
     // String? questionText;  => use ? after data type during initialization of variable in constructor  => during calling of variable value add ! at last
     //                        =>Example=> return _questionBank[_questionNumber].questionText!;
     // bool? questionAnswer;

            String questionText; //for now somehow this thing is working
            bool questionAnswer;
            Question(this.questionText, this.questionAnswer);


      // Question(required String q , required bool q)
      // {
      //   questionText = q;
      //   questionAnswer =a;
      // }
      //
      // or
      //
      // Question(String? q ,  bool? a)
      // {
      //   questionText = q;
      //   questionAnswer =a;
      // }
}