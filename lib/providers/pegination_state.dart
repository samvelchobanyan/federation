import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:federation/models/persons/person_model.dart';

class PagenationState {
  final List<PersonItem> personsList;
  final int  page;
  final String errorMessage;

  PagenationState(
    this.personsList,
    this.page,
    this.errorMessage,
  ); 

  PagenationState copyWith({
    List<PersonItem>? personsList,
    int? page,
    String? errorMessage,
  }) {
    return PagenationState(
      personsList ?? this.personsList,
      page ?? this.page,
      errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PagenationState &&
      listEquals(other.personsList, personsList) &&
      other.page == page &&
      other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => personsList.hashCode ^ page.hashCode ^ errorMessage.hashCode;
}

