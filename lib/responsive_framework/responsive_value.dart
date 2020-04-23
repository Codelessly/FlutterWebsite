import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:flutter_website/responsive_framework/responsive_framework.dart';

typedef T Value<T>();
typedef StartListening<T> = VoidCallback Function(Value<T> element, T value);

class ResponsiveValue<T> {
  T value;
  String greaterThan = ">";
  String smallerThan = "<";
}

class ResponsiveVisibility extends StatefulWidget {
  final Widget child;
  final bool visible;
  final List<ResponsiveCondition> conditionVisible;
  final List<ResponsiveCondition> conditionHidden;
  final Widget replacement;
  final bool maintainState;
  final bool maintainAnimation;
  final bool maintainSize;
  final bool maintainSemantics;
  final bool maintainInteractivity;

  const ResponsiveVisibility({
    Key key,
    @required this.child,
    this.visible = true,
    this.conditionVisible,
    this.conditionHidden,
    this.replacement = const SizedBox.shrink(),
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
    this.maintainSemantics = false,
    this.maintainInteractivity = false,
  }) : super(key: key);

  @override
  _ResponsiveVisibilityState createState() => _ResponsiveVisibilityState();
}

class _ResponsiveVisibilityState extends State<ResponsiveVisibility>
    with WidgetsBindingObserver {
  List<ResponsiveCondition> conditions = [];
  ResponsiveCondition activeCondition;
  bool visiblePlaceholder;

  @override
  void initState() {
    super.initState();
    visiblePlaceholder = widget.visible;
    conditions
        .addAll(widget.conditionVisible.map((e) => e.copyWith(value: true)));
    conditions
        .addAll(widget.conditionHidden.map((e) => e.copyWith(value: false)));
    conditions.sort((a, b) => a.breakpoint.compareTo(b.breakpoint));

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setDimensions();
      setState(() {});
    });
  }

  void setDimensions() {
    // Breakpoint reference check. Verify a parent
    // [ResponsiveWrapper] exists if a reference is found.
    if (conditions?.firstWhere((element) => element.name != null,
            orElse: () => null) !=
        null) {
      try {
        ResponsiveWrapper.of(context);
      } catch (e) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary(
              "A ResponsiveCondition was caught referencing a nonexistant breakpoint."),
          ErrorDescription(
              "A ResponsiveCondition requires a parent ResponsiveWrapper "
              "to reference breakpoints. Add a ResponsiveWrapper or remove breakpoint references.")
        ]);
      }
    }

    activeCondition = getActiveCondition();
    visiblePlaceholder = activeCondition?.value ?? widget.visible;
  }

  ResponsiveCondition getActiveCondition() {
    ResponsiveCondition equalsCondition = conditions.firstWhere((element) {
      if (element.condition == InternalResponsiveCondition.EQUAL) {
        return ResponsiveWrapper.of(context).activeBreakpoint.name ==
            element.name;
      }

      return false;
    }, orElse: () => null);
    if (equalsCondition != null) {
      return equalsCondition;
    }

    ResponsiveCondition smallerThanCondition = conditions.firstWhere((element) {
      if (element.condition == InternalResponsiveCondition.SMALLER_THAN) {
        if (element.name != null) {
          return ResponsiveWrapper.of(context).isSmallerThan(element.name);
        }

        return MediaQuery.of(context).size.width < element.breakpoint;
      }
      return false;
    }, orElse: () => null);
    if (smallerThanCondition != null) {
      return smallerThanCondition;
    }

    ResponsiveCondition largerThanCondition =
        conditions.reversed.firstWhere((element) {
      if (element.condition == InternalResponsiveCondition.LARGER_THAN) {
        if (element.name != null) {
          return ResponsiveWrapper.of(context).isLargerThan(element.name);
        }

        return MediaQuery.of(context).size.width >= element.breakpoint;
      }
      return false;
    }, orElse: () => null);
    if (largerThanCondition != null) {
      return largerThanCondition;
    }

    return null;
  }

  ResponsiveCondition getActiveConditionIf() {
    for (ResponsiveCondition visibilityCondition in conditions) {
      switch (visibilityCondition.condition) {
        case InternalResponsiveCondition.EQUAL:
          break;
        case InternalResponsiveCondition.SMALLER_THAN:
          if (visibilityCondition.name != null) {
            if (ResponsiveWrapper.of(context)
                .isSmallerThan(visibilityCondition.name)) {
              return visibilityCondition;
            }
          } else {
            if (MediaQuery.of(context).size.width <
                visibilityCondition.breakpoint) {
              return visibilityCondition;
            }
          }
          break;
        case InternalResponsiveCondition.LARGER_THAN:
          break;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: widget.child,
      replacement: widget.replacement,
      visible: visiblePlaceholder,
      maintainState: widget.maintainState,
      maintainAnimation: widget.maintainAnimation,
      maintainSize: widget.maintainSize,
      maintainSemantics: widget.maintainSemantics,
      maintainInteractivity: widget.maintainInteractivity,
    );
  }

  bool between(double number, double a, double b) {
    return math.min(a, b) <= number && number < math.max(a, b);
  }
}

enum InternalResponsiveCondition {
  LARGER_THAN,
  EQUAL,
  SMALLER_THAN,
}

class ResponsiveCondition {
  final int breakpoint;
  final String name;
  final InternalResponsiveCondition condition;
  final bool value;

  ResponsiveCondition._(
      {this.breakpoint, this.name, this.condition, this.value})
      : assert(breakpoint != null || name != null),
        assert(breakpoint == null || name == null),
        assert((condition == InternalResponsiveCondition.EQUAL)
            ? name != null
            : true);

  ResponsiveCondition.equals({String name, bool value})
      : this.breakpoint = null,
        this.name = name,
        this.condition = InternalResponsiveCondition.LARGER_THAN,
        this.value = value;

  ResponsiveCondition.isLargerThan({int breakpoint, String name, bool value})
      : this.breakpoint = breakpoint,
        this.name = name,
        this.condition = InternalResponsiveCondition.LARGER_THAN,
        this.value = value;

  ResponsiveCondition.isSmallerThan({int breakpoint, String name, bool value})
      : this.breakpoint = breakpoint,
        this.name = name,
        this.condition = InternalResponsiveCondition.SMALLER_THAN,
        this.value = value;

  ResponsiveCondition copyWith({
    int breakpoint,
    String name,
    InternalResponsiveCondition condition,
    bool value,
  }) =>
      ResponsiveCondition._(
        breakpoint: breakpoint ?? this.breakpoint,
        name: name ?? this.name,
        condition: condition ?? this.condition,
        value: value ?? this.value,
      );

  int sort(ResponsiveCondition a, ResponsiveCondition b) {
    if (a.breakpoint == b.breakpoint) return 0;

    return (a.breakpoint < b.breakpoint) ? -1 : 1;
  }
}
