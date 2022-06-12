abstract class NewStates {}

class NewInitialStates extends NewStates {}

class NewButtonStates extends NewStates {}

class NewGetBusinessLoadingStates extends NewStates {}

class NewGetBusinessSuccessStates extends NewStates {}

class NewGetBusinessErrorStates extends NewStates {
   final String error;
   NewGetBusinessErrorStates(this.error);
}

class NewGetSportsLoadingStates extends NewStates {}

class NewGetSportsSuccessStates extends NewStates {}

class NewGetSportsErrorStates extends NewStates {
   final String error;
   NewGetSportsErrorStates(this.error);
}
class NewGetScienceLoadingStates extends NewStates {}

class NewGetScienceSuccessStates extends NewStates {}

class NewGetScienceErrorStates extends NewStates {
   final String error;
   NewGetScienceErrorStates(this.error);
}

class NewGetTechnologyLoadingStates extends NewStates {}

class NewGetTechnologySuccessStates extends NewStates {}

class NewGetTechnologyErrorStates extends NewStates {
   final String error;

   NewGetTechnologyErrorStates(this.error);
}

class NewChangerThemeModeStates extends NewStates {}

class NewGetSearchLoadingStates extends NewStates {}

class NewGetSearchSuccessStates extends NewStates {}

class NewGetSearchErrorStates extends NewStates {
   final String error;

   NewGetSearchErrorStates(this.error);
}

