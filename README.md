# The Bank Tech Test

Check the commit log for this, I've heavily annotated each commit to explain
what I've been doing as I've cleaned up the code.

### Resources

This solution was influenced by those done by [Sandro
Mancuso](https://github.com/sandromancuso) in Java:

* [Bank Kata walkthrough - part 1](https://www.youtube.com/watch?v=XHnuMjah6ps)
* [Bank Kata walkthrough - part 2](https://www.youtube.com/watch?v=gs0rqDdz3ko)
* [Bank Kata walkthrough - part 3](https://www.youtube.com/watch?v=R9OAt9AOrzI)
* [Code for a slightly different version by
  Sandro](https://github.com/sandromancuso/Bank-kata)

>When in doubt, go for the simplest solution

### Requirements
* Deposits, withdrawal
* Account statement (date, amount, balance)
* Statement printing

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see  


```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Additional extensions

* Statement filters (just deposits, withdrawals, date ascending, date descending)
* Graphical interface
