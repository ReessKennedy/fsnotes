# New Note Editor Speedup

We recently made the "new note" flow feel faster by removing the default UIKit navigation push animation when the editor opens.

## What we changed

In `FSNotes iOS/ViewController.swift`, the `openEditorViewController()` method now pushes the editor with:

```swift
navigationController?.pushViewController(evc, animated: false)
```

Before this change, the same push used `animated: true`, which made the editor slide in from the left.

## Why it felt slow

The note was already created and loaded, but the extra transition added visible delay. Turning off the animation makes the editor appear immediately, so the app feels more responsive when creating a new note or file.

## Where it applies

This affects the flow that creates a note, fills the editor, and then opens the editor view controller right away.

## Commit reference

This change was made in commit `6da331d3`:

> Disable slide-in animation when opening a note to improve editor load speed
