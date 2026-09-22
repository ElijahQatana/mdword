---
title: Breakroom Snack Council Quarterly Report
subtitle: Q3 findings on the state of the snack drawer
author: The Breakroom Snack Council
date: September 22, 2026
---

# Overview

This report summarizes snack drawer activity for the quarter. Overall snack velocity was **up 12%**, driven almost entirely by a single employee we are choosing not to name.

## Key Metrics

The table below breaks down consumption by snack category.

| Snack           | Units Consumed | Restocks | Complaints |
|------------------|----------------|----------|------------|
| Pretzels         | 214            | 3        | 0          |
| Granola Bars     | 187            | 2        | 1          |
| Mystery Trail Mix | 41            | 1        | 9          |
| Gummy Worms      | 302            | 4        | 0          |
| Rice Cakes       | 6              | 0        | 2          |

## Notable Events

- The gummy worm shortage of week 6 has been fully resolved
- A new vending machine was installed near the printer nobody uses
- Ongoing investigation:
  1. Who keeps taking exactly one rice cake and leaving the rest
  2. Whether that counts as a crime
  3. Whether anyone actually likes rice cakes

> Note: the mystery trail mix will not be restocked until someone admits what is actually in it.

### Further Reading

1. Full inventory log is available on request
   1. Requests must be submitted in writing
2. The vending machine's card reader is still broken
3. Please stop microwaving fish

#### A Small Aside

This section is smaller than the others for no particular reason.

##### An Even Smaller Aside

This section exists mostly to prove that heading six still works.

###### The Smallest Aside

If you can read this, your font size settings are very generous.

### Technical Notes

Snack levels are tracked with a small script that runs every morning.

```sql
SELECT snack, SUM(units_consumed) AS total
FROM breakroom_log
WHERE quarter = 'Q3'
GROUP BY snack
ORDER BY total DESC;
```

You can also check current levels with `snackctl status`, assuming someone remembered to update the counts.

## Closing Notes

Full minutes from the last council meeting are available [here](https://example.com/breakroom-minutes). Please direct all snack-related grievances to the suggestion box, which is also a shoebox.
