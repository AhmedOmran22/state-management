# Flutter State Management Comparison: Provider, Cubit & Riverpod

## Introduction
Welcome to this architectural showcase! This repository is designed to help Flutter developers understand the practical differences between three of the most popular state management solutions: **Provider**, **Cubit (Bloc)**, and **Riverpod**. By implementing the exact same core feature using all three approaches, this project offers a clear, side-by-side comparison of how each solution handles state, dependency injection, and UI updates in a real-world scenario.

## The Idea Behind the Project
When building Flutter applications, choosing the right state management solution and structuring your architecture can be challenging. The goal of this project is to remove the ambiguity by showing how the same feature can be implemented with different tools while maintaining a clean and scalable architecture.

In this project, the core feature is simple but comprehensive: **fetching a list of products from a remote API and displaying them in the UI**.

To demonstrate the differences:
* The same core feature is implemented **three separate times**, each using a completely different state management approach.
* Each implementation is fully functional and distinct.
* Every approach includes its own **favorite icon logic**, meaning there are three separate favorite icon widgets, each uniquely connected to its respective state management solution.

## The Three Implementations

### 1. Provider Implementation
Demonstrates how to manage state and dependencies using the traditional `ChangeNotifier` and `Provider` paradigm. It relies on a Service Locator (e.g., GetIt) for dependency injection and orchestrates state changes cleanly within the widget tree.

### 2. Cubit (Bloc) Implementation
Showcases the Bloc library's lighter counterpart, `Cubit`. It uses `BlocBuilder` and `BlocProvider` to react to state changes efficiently. Like the Provider approach, it uses a Service Locator to resolve dependencies, enforcing strict separation between business logic and the UI.

### 3. Riverpod Implementation
Illustrates a modern, compile-safe approach to state management. A key differentiator here is that **a Service Locator is not required**. Riverpod inherently manages dependencies through its robust `Provider` ecosystem, demonstrating its built-in DI capabilities and compile-time safety.

## Architecture Overview
This project strictly follows **Clean Architecture principles** to ensure separation of concerns. The codebase is divided into three distinct layers:

* **Presentation Layer**: Contains the UI widgets, screens, and routing logic. The UI strictly listens to state and delegates actions to the state management layer.
* **State Management Layer**: The bridge between the UI and data. It dictates the business logic and emits states (handled uniquely by Provider, Cubit, or Riverpod).
* **Data Logic Layer**: Responsible for fetching data from external APIs, handling models, and communicating with the backend APIs.

## Key Concepts Demonstrated
* **Practical Side-by-Side Comparison**: Learn the syntax, boilerplate, and philosophy behind Provider, Cubit, and Riverpod.
* **Dependency Injection (DI)**: Understand how DI is handled when using a Service Locator versus Riverpod's native ecosystem.
* **Isolated Component State**: See how localized states (like toggling a favorite icon) are managed independently within each architectural approach without rebuilding entire screens.
* **Clean Code Practices**: Explore a structured codebase that emphasizes modularity and single responsibility.

## Folder Structure Explanation
To make navigation intuitive, the project is structured by feature rather than by layer. This keeps related code grouped together.

```text
lib/
├── core/
│   ├── network/          # API clients, interceptors
│   ├── di/               # Service Locator setup (for Provider & Cubit)
│   ├── routes/           # Navigation logic
│   └── shared/           # Reusable components and UI states
├── features/
│   └── products/
│       ├── data/         # Models, Repositories, API calls
│       ├── presentation/
│       │   ├── cubit/    # Cubit state and logic
│       │   ├── provider/ # ChangeNotifier and logic
│       │   ├── riverpod/ # Riverpod providers and logic
│       │   ├── views/    # The screens displaying the implementations
│       │   └── widgets/  # Reusable UI elements (like favorite icons)
└── main.dart             # Application entry point
```

## Why UI State Abstraction is Useful
One of the core architectural decisions in this project is the creation of a **Shared UI State structure** (e.g., `Loading`, `Success`, `Error`). 

Abstracting the UI state provides several benefits:
* **Consistency**: The UI handles loading spinners, error messages, and successful data rendering uniformly across all implementations.
* **Reusability**: You write the boilerplate for handling states once and apply it to Provider, Cubit, and Riverpod alike.
* **Readability**: It simplifies the UI code, preventing nested `if-else` blocks and making the widget tree much easier to read and maintain.

## A Short Comparison: Provider vs. Cubit vs. Riverpod

| Feature | Provider | Cubit (Bloc) | Riverpod |
| :--- | :--- | :--- | :--- |
| **Learning Curve** | Gentle (Flutter Team Recommended) | Moderate | Moderate to Steep |
| **Boilerplate** | Low | Medium | Low to Medium |
| **State Mutability** | Mutable (`ChangeNotifier`) | Immutable (State Classes) | Immutable |
| **Dependency Injection** | Requires Service Locator / MultiProvider | Requires Service Locator / BlocProvider | **Built-in** (No Service Locator needed) |
| **Compile-time Safety** | No (Runtime exceptions possible) | Yes | **Yes** (Highly robust) |
| **Best For** | Simple apps, quick prototyping | Scalable apps, event-driven logic | Scalable, highly testable modern apps |

## Conclusion
Whether you are migrating an existing app or starting a new one, choosing a state management tool is a significant decision. Feel free to explore the code, experiment with the different approaches, and see which paradigm fits your team's workflow the best!
