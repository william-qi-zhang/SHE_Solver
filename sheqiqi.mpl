SheQiQi := module()

export plot_all_angles;

options package;

uses plots;

    plot_all_angles := proc(total)
    local plot_counter := 0:
    local i := 0:
    for i from 1 by 1 to total do
        local angles;
        if i = 1 then read "n9_1_50.m"; angles := test; print(i);
        elif i = 51 then read "n9_51_60.m"; angles := test; print(i);
        elif i = 60 then read "n9_60_80.m"; angles := test; print(i);
        elif i = 81 then read "n9_81_90.m"; angles := test; print(i);
        elif i = 90 then read "n9_90_99.m"; angles := test; print(i);
        elif i = 100 then read "n9_100_150.m"; angles := test; print(i);
        elif i = 151 then read "n9_151_170.m"; angles := test; print(i);
        elif i = 170 then read "n9_170_179.m"; angles := test; print(i);
        elif i = 180 then read "n9_180_190.m"; angles := test; print(i);
        elif i = 191 then read "n9_191_199.m"; angles := test; print(i);
        elif i = 200 then read "n9_200_250.m"; angles := test; print(i);
        elif i = 250 then read "n9_250_259.m"; angles := test; print(i);
        elif i = 260 then read "n9_260_270.m"; angles := test; print(i);
        elif i = 270 then read "n9_270_299.m"; angles := test; print(i);
        elif i = 300 then read "n9_300_350.m"; angles := test; print(i);
        elif i = 350 then read "n9_350_369.m"; angles := test; print(i);
        elif i = 370 then read "n9_370_389.m"; angles := test; print(i);
        elif i = 390 then read "n9_390_399.m"; angles := test; print(i);
        elif i = 400 then read "n9_400_430.m"; angles := test; print(i);
        elif i = 430 then read "n9_430_449.m"; angles := test; print(i);
        elif i = 450 then read "n9_450_469.m"; angles := test; print(i);
        elif i = 470 then read "n9_470_489.m"; angles := test; print(i);
        elif i = 490 then read "n9_490_499.m"; angles := test; print(i);
        elif i = 500 then read "n9_500_530.m"; angles := test; print(i);
        elif i = 530 then read "n9_530_549.m"; angles := test; print(i);
        elif i = 550 then read "n9_550_569.m"; angles := test; print(i);
        elif i = 570 then read "n9_570_589.m"; angles := test; print(i);
        elif i = 590 then read "n9_590_609.m"; angles := test; print(i);
        elif i = 610 then read "n9_610_629.m"; angles := test; print(i);
        elif i = 630 then read "n9_630_649.m"; angles := test; print(i);
        elif i = 650 then read "n9_650_669.m"; angles := test; print(i);
        end if:

        local mod_index := 0:
        local mod_total := nops(angles):

        for mod_index from 1 by 1 to mod_total do
            local solutions := nops(angles[mod_index,1]);
            local modulation := [seq(angles[mod_index,2],i=1..9)]:

            local counter := 0;
            local num_solution:=0;
            local color_solution:=["Crimson","LimeGreen","Gold","yellow"];

            for counter from 1 by 1 to solutions do
                # print(angles[mod_index,1,counter,2]):
                local ele_level := 0:
                local max_ele_level := 0:

                local temp := 0:
                for temp from 1 by 1 to 9 do 
                    ele_level := ele_level + angles[mod_index,1,counter,2,temp]:
                    if (abs(ele_level) > max_ele_level) then max_ele_level := abs(ele_level): end if: 
                end do:
                 #print(max_ele_level):
                
               
                if (max_ele_level = 1) then 
                    num_solution:=num_solution+1;
                    if num_solution>4 then
                        break:
                    end if:
                    if (1 <= num_solution) and (num_solution <= 4) then   
                    plot_counter := plot_counter + 1:
                    p(plot_counter) := plot(modulation,angles[mod_index,1,counter,1],x=0..1,y=0..90,style = point,symbol=asterisk,thickness=0,axis = [gridlines],color = color_solution[num_solution]):      
                    end if:

                end if:

            end do:
        end do:
    end do:
     display([seq(p(i),i=1..plot_counter)]);
    end proc;

end module:
