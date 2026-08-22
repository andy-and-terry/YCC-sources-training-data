"""Demonstrates a realistic exception hierarchy for a small API client,
including error chaining and a retry-aware base class."""

from dataclasses import dataclass
from typing import Optional


class ApiError(Exception):
    """Base class for all errors raised by the API client."""


@dataclass
class HttpError(ApiError):
    status_code: int
    url: str
    body: Optional[str] = None

    def __str__(self) -> str:
        return f"HTTP {self.status_code} for {self.url}: {self.body or ''}".strip()


class ClientError(HttpError):
    """4xx responses -- the caller did something wrong; don't retry."""


class ServerError(HttpError):
    """5xx responses -- transient; safe to retry."""


class RateLimitedError(ServerError):
    def __init__(self, url: str, retry_after: float):
        super().__init__(status_code=429, url=url, body="rate limited")
        self.retry_after = retry_after


class ValidationError(ApiError):
    def __init__(self, field: str, message: str):
        super().__init__(f"invalid field '{field}': {message}")
        self.field = field
        self.message = message


def raise_for_status(status_code: int, url: str, body: Optional[str] = None, retry_after: float = 0):
    if status_code == 429:
        raise RateLimitedError(url, retry_after)
    if 500 <= status_code < 600:
        raise ServerError(status_code=status_code, url=url, body=body)
    if 400 <= status_code < 500:
        raise ClientError(status_code=status_code, url=url, body=body)


def is_retryable(error: Exception) -> bool:
    return isinstance(error, ServerError)


if __name__ == "__main__":
    try:
        raise_for_status(503, "https://api.example.com/users", "service unavailable")
    except ApiError as e:
        print(f"{type(e).__name__}: {e} (retryable={is_retryable(e)})")

    try:
        raise_for_status(404, "https://api.example.com/users/999")
    except ApiError as e:
        print(f"{type(e).__name__}: {e} (retryable={is_retryable(e)})")
