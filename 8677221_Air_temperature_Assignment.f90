program temperature_conversion
  implicit none
  integer, parameter :: n = 36
  real :: temperature(n)
  integer :: i

  ! Open the input file
  open(unit=10, file='Air_temperature.csv', status='old')

  do i = 1, n
    ! Read the temperature values from the file
    read(10, *) temperature(i)
  end do

  ! Close the input file
  close(10)

  ! Convert the temperature values using the conversion function
  call convert_temperature(temperature, n)

  ! Open the output file
  open(unit=20, file='8677221_Air_temperature_Assignment.csv', status='replace')

  ! Write the header line to the output file
  write(20, *) 'Index,Original Temperature (Celsius),Converted Temperature (Kelvin)'

  ! Write the converted temperature values to the output file
  do i = 1, n
    write(20, '(I2, ",", F6.2, ",", F10.2)') i, temperature(i) - 273.15, temperature(i)
  end do

  ! Close the output file
  close(20)

contains

  subroutine convert_temperature(temps, num)
    implicit none
    real, intent(inout) :: temps(:)
    integer, intent(in) :: num
    integer :: i

    do i = 1, num
      ! Convert the temperature from degrees Celsius to Kelvin
      temps(i) = temps(i) + 273.15
    end do

  end subroutine convert_temperature

end program temperature_conversion

