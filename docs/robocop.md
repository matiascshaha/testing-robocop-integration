
---

# Robocop Documentation

**Robocop** is a linter for Robot Framework files. It helps you identify issues and enforce code standards, ensuring your `.robot` files are well-structured and follow best practices.

---

## 1. Installation

You can install Robocop via `pip` or manage it via Poetry in your project.

### Using pip:
```bash
pip install robocop
```

### Using Poetry:
```bash
poetry add --dev robocop
```

---

## 2. Basic Usage

To run Robocop on your Robot Framework files:

```bash
robocop <path_to_your_robot_files>
```

For example:
```bash
robocop src/camsTest
```

Robocop will lint your files and display any warnings or errors found.

---

## 3. Common Options

- **Generate a report** in SARIF or other formats (e.g., for code scanning tools):
  ```bash
  robocop --reports sarif .
  ```

- **List all available rules**:
  ```bash
  robocop --list
  ```

- **Enable specific rules** (for example, only run rule 0101):
  ```bash
  robocop --include 0101
  ```

- **Exclude specific rules** (for example, skip rule 0401):
  ```bash
  robocop --exclude 0401
  ```

- **Set severity threshold** (only show warnings of a certain severity):
  ```bash
  robocop --threshold error
  ```

  This will only show linting errors (and ignore warnings or info-level issues).

- **Ignore specific files or directories**:
  ```bash
  robocop --ignore tests/
  ```

- **Save output to a file**:
  ```bash
  robocop --output robocop-results.txt
  ```

  This will save the linting results to `robocop-results.txt`.

---

## 4. Configuration File

You can configure Robocop using either a `.robocop` file or within your `pyproject.toml` file.

### Using `.robocop` file:

Example configuration in `.robocop`:
```ini
[robocop]
include = 0101, 0203  # Only include these rules
exclude = 0401        # Exclude this rule

[threshold]
info = 5              # Set threshold for the severity of rules to display
warning = 10
error = 15
```

### Using `pyproject.toml`:

Example configuration in `pyproject.toml`:
```toml
[tool.robocop]
include = ["0101", "0203"]
exclude = ["0401"]
ignore = ["tests/*"]

[tool.robocop.threshold]
info = 5
warning = 10
error = 15
```

---

## 5. Checking Active Rules

To check which rules are currently enabled in Robocop, you can run:

```bash
robocop --list
```

This will display all available rules, along with an indication of whether they are enabled or disabled.

---

## 6. Running Robocop with Verbose Output

For more detailed information during the linting process, use the `--verbose` flag:

```bash
robocop --verbose <path>
```

This will show more detailed logs during execution, including which rules are applied and the status of each.

---

## 7. Integrating with CI Pipelines

It’s a good idea to integrate Robocop with your CI/CD pipeline to enforce code quality.

### Example GitHub Actions Pipeline Step:

```yaml
- name: Run Robocop
  run: |
    poetry run robocop --reports sarif src/camsTest
```

This will lint your `src/camsTest` directory and generate a SARIF report, which can be used for code scanning.

---

## Helpful Documentation Links

- **Robocop Rules and Error Codes Documentation**:  
  [Robocop Rules Documentation](https://robocop.readthedocs.io/en/latest/rules.html)

This documentation provides detailed descriptions of all Robocop rules, which helps understand why a certain rule has been triggered and how to resolve the issue.

---