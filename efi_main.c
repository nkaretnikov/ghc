#include <efi.h>
#include <efilib.h>

int main(int argc, char *argv[]);

EFI_STATUS
EFIAPI
efi_main (EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable) {
    InitializeLib(ImageHandle, SystemTable);
    Print(L"efi_main called\r\n");

    int argc = 1;
    char *argv = "";
    main(argc, &argv);

    for (;;); // XXX: loop forever

    return EFI_SUCCESS;
}
