package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var projectVersion string

var rootCmd = &cobra.Command{
	Use:     "easy-ver",
	Short:   "easy-ver",
	Long:    "easy-ver",
	Version: projectVersion,
}

// Execute root cli command
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
