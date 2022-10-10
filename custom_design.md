# My Custom Design For Flutter

## Full Screen Gradient

```dart
Container(
    padding: const EdgeInsets.all(10),
    width: 100.w,
    height: 100.h,
    decoration: BoxDecoration(
        gradient: RadialGradient(
            center: const Alignment(-1.5, -1), // near the top right
            radius: 1.8,
            colors: [
                const Color(0xFF00EC97),
                greenColor,
            ],
        )
    ),
    chile: Column()
),
```