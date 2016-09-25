select distinct firstName, lastName, email, HKIDPassportNumber
from Client,SecurityHolding
where code ='22' and Client.accountNumber = SecurityHolding.accountNumber and type='stock'
order by lastNames