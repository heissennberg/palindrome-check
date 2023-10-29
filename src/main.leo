program palindrome_check.aleo {
    inline num_len(number: u32) -> u32 {
        if number == 0u32 {
            return 1u32;
        }
        let len: u32 = 0u32;
        for i: u32 in 0u32..10u32 {
            let digit: u32 = number / 10u32 ** i % 10u32;
            if digit != 0u32 {
                len = i + 1u32;
            }
        }
        return len;
    }

    transition main(public a: u32) -> bool {
        let isPalindrome: bool = true;
        let len: u32 = num_len(a);
        for i: u32 in 0u32..9u32 {
            if (i < len / 2u32 + 1u32 && isPalindrome) 
            {
                let left: u32 = a / 10u32 ** (len - i - 1u32) % 10u32;
                let right: u32 = a % 10u32 ** (i + 1u32) / 10u32 ** i;
                if (left != right)
                {
                    isPalindrome = false;
                }
            }
        }
        return isPalindrome;
    }
}
