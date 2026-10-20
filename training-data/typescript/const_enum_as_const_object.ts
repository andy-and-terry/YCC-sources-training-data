// `as const` object + derived union type as an alternative to enum.
const Status = {
  Idle: "idle",
  Running: "running",
  Done: "done",
} as const;

type Status = (typeof Status)[keyof typeof Status];

function next(s: Status): Status {
  switch (s) {
    case Status.Idle: return Status.Running;
    case Status.Running: return Status.Done;
    case Status.Done: return Status.Done;
  }
}

console.log(next(Status.Idle), next("running"));
