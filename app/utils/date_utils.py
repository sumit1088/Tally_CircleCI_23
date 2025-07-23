import re
from dateutil import parser
from datetime import date


def extract_date_range_from_prompt(prompt: str) -> tuple[str, str] | None:
    """Extracts month/year from prompt like 'April 2023' and returns date range as (start_date, end_date)."""
    match = re.search(
        r"(January|February|March|April|May|June|July|August|September|October|November|December)\s+(\d{4})",
        prompt,
        re.IGNORECASE
    )
    if match:
        month_str, year = match.groups()
        start_date = parser.parse(f"1 {month_str} {year}").date()

        # Get the first day of next month
        if start_date.month == 12:
            end_date = date(start_date.year + 1, 1, 1)
        else:
            end_date = date(start_date.year, start_date.month + 1, 1)

        return str(start_date), str(end_date)
    return None
