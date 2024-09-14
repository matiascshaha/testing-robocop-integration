
---

# Robotidy Documentation

**Robotidy** is an automatic code formatter for Robot Framework files. It ensures consistent formatting of your `.robot` files according to best practices.

---

## 1. Installation

You can install Robotidy via `pip` or manage it via Poetry in your project.

### Using pip:
```bash
pip install robotframework-tidy
```

### Using Poetry:
```bash
poetry add --dev robotframework-tidy
```

---

## 2. Basic Usage

To run Robotidy and format your `.robot` files, use the following command:

```bash
robotidy <path_to_your_robot_files>
```

For example:
```bash
robotidy src/camsTest
```

This will automatically reformat the files in the `src/camsTest` directory.

---

## 3. Common Options

- **Preview changes** without modifying the files:
  ```bash
  robotidy --check <path>
  ```

- **Set custom formatting rules**:
  Robotidy allows customization by passing configurations via a `.pyproject.toml` file.

  Example `pyproject.toml` for custom rules:
  ```toml
  [tool.robotidy]
  space_count = 4  # Use 4 spaces
  line_length = 120  # Max line length
  ```

- **Exclude files or directories** from being formatted:
  ```bash
  robotidy --exclude test_data/ .
  ```

- **Set specific transformers** (transformers are formatting rules):
  ```bash
  robotidy --transform AlignVariablesSection
  ```

  You can also **disable specific transformers**:
  ```bash
  robotidy --skip AlignVariablesSection
  ```

- **List available transformers**:
  ```bash
  robotidy --list
  ```

---

## 4. Configuration File

You can configure Robotidy in your `pyproject.toml` file. This makes it easier to share consistent settings across your team.

Example `pyproject.toml` configuration:
```toml
[tool.robotidy]
space_count = 4
line_length = 120

[tool.robotidy.transformers]
AlignVariablesSection = { up_to_column = 4 }
NormalizeAssignments = { equal_sign_type = "right" }
```

---

## 5. Checking Active Rules

To see the list of currently active rules (transformers), run:

```bash
robotidy --list-transformers
```

This will print out all the formatting rules (transformers) Robotidy will apply to your `.robot` files.

---
