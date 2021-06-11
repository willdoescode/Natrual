# Haskell Nat Implementation

![example](example.png)

## Testing

```shell
ghc Main.hs -package HUnit
./main
```

## Addition

```markdown
(S (S Z)) + (S (S Z))
(S (a + k))
(S (S (a + Z)))
(S (S (a)))
(S (S (S (S Z)))) == 4
```

## Multiplication

```markdown
(S (S Z)) * (S (S Z))
(S ((S (S Z)) + (S (S Z))))
(S (S (S (S (S (S (S (S Z)))))))
```
